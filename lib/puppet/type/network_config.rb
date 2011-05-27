require 'puppet'

module Puppet

  Puppet::Type.newtype(:network_config) do
    @doc = "The network configuration type"

    ensurable

    newparam(:exclusive) do
      d = "Enforces that no network configuration exists besides what puppet defines.\n"
      d << "Enabled by default, set it to false in any resource to disable globally."
      desc(d)

      newvalues(:true, :false)
      # this behaviorally defaults to true (see network_scripts.rb exists?()/initialize())
      # using defaultto(:true) would prevent users from setting this to false
    end

    newparam(:device) do
      isnamevar
      desc "The network device to be configured"
    end

    newparam(:bootproto) do
      desc "Boot priority for the network device"
      newvalues(:dhcp, :static, :dialup, :none)
      defaultto(:dhcp)
    end

    newparam(:onboot) do
      desc "Start the network device on boot"
      newvalues(:yes, :no)
      defaultto(:yes)
    end

    newparam(:nozeroconf) do
      desc "Skip zeroconf (aka local-link) configuration"
      newvalues(:yes, :no)
    end

    newparam(:netmask) do
      desc "Configure the subnetmask of the device"
    end

    newparam(:prefix) do
      desc "Configure the network prefix, Has precedence over NETMASK on redhat."
    end

    newparam(:network) do
      desc "Configure the network of the device"
    end

    newparam(:broadcast) do
      desc "Configure the broadcast of the device"
    end

    newparam(:ipaddr) do
      desc "Configure the IP address of the device"
    end

    newparam(:gateway) do
      desc "Configure the Gateway of the device"
    end

    newparam(:hwaddr) do
      desc "Hardware address of the device"
    end

    newparam(:domain) do
      desc "Configure the domain of the device"
    end

    newparam(:bridge) do
      desc "The bridge in which the device is enslaved (if any)"
    end

    newparam(:stp) do
      desc "Enable STP (only applicable to type=Bridge devices)"
    end

    newparam(:delay) do
      desc "Configure forward delay (only applicable to type=Bridge devices)"
    end

    newparam(:peerdns) do
      desc "modify /etc/resolv.conf if peer uses msdns extension (PPP only) or
 DNS{1,2} are set, or if using dhclient. default to 'yes'."
      newvalues(:yes, :no)
    end

    newparam(:dns1) do
      desc "primary DNS server IPADDR"
    end

    newparam(:dns2) do
      desc "secondary DNS server IPADDR"
    end

    newparam(:type) do
      desc "Type of the device"
      newvalues(:Ethernet, :Bridge, :Bonding, :xDSL)
    end

    newparam(:vlan) do
      desc "Is the device VLAN tagged (802.1q)"
      newvalues(:yes, :no)
    end

    newparam(:userctl) do
      desc "Non root users are allowed to control device if set to yes"
      newvalues(:yes, :no)
      defaultto(:no)
    end

    newparam(:bonding_opts) do
      desc "Configures bonding parameter"
    end

    newparam(:master) do
      desc "Configures the bonding device to which the device is enslaved (set 'slave=>yes' too)"
    end

    newparam(:slave) do
      desc "Configures whether or not the device is enslaved to a bonding device"
      newvalues(:yes, :no)
    end

    newparam(:ipv6init) do
      desc "Controls IPv6 configuration for this interface"
      newvalues(:yes, :no)
    end

    newparam(:pidfile) do
      desc "Lockfile location for the xDSL connection"
    end

    newparam(:firewall) do
      desc "Firewall type of the xDSL connection"
      newvalues(:NONE, :STANDALONE, :MASQUERADE)
    end

    newparam(:ping) do
      desc "Character to print during xDSL connection setup"
    end

    newparam(:pppoe_timeout) do
      desc "Timeout in seconds without traffic after which the xDSL session will be torn down"
    end

    newparam(:lcp_failure) do
      desc "How many unanswered LCP echo requests pass before xDSL peer is considered dead"
    end

    newparam(:lcp_interval) do
      desc "Interval in seconds between send LCP echo requests"
    end

    newparam(:clampmss) do
      desc "MSS Clamping for xDSL connections"
    end

    newparam(:connect_poll) do
      desc "How often to check during xDSL connection setup if the connection timeout expired"
    end

    newparam(:connect_timeout) do
      desc "Initial xDSL connection timeout"
    end

    newparam(:idletimeout) do
      desc "Timeout when a xDSL connection without traffic can be considered idle and be torn down in a on-demand dial setup"
    end

    newparam(:persist) do
      desc "Whether to persist connecting via pppd after a connection is terminated"
      newvalues(:yes, :no)
    end

    newparam(:synchronous) do
      desc "Use synchronous PPP encapsulation for xDSL connections"
      newvalues(:yes, :no)
    end

    newparam(:defroute) do
      desc "Set the default route to the xDSL connection"
      newvalues(:yes, :no)
    end

    newparam(:user) do
      desc "The username to use for the xDSL connection"
    end

    newparam(:eth) do
      desc "The ethernet interface to use for the xDSL pppoe connection"
    end

    newparam(:demand) do
      desc "Whether to create a dial on-demand connection"
      newvalues(:yes, :no)
    end
  end
end
