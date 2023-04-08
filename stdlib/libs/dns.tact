import "./dns.fc";

struct DNSResolveResult {
    prefix: Int; 
    record: Cell?; 
}

@name(dns_string_to_internal)
native dnsStringToInternal(str: String): Slice?;

@name(dns_internal_normalize)
native dnsInternalNormalize(src: Slice): Slice;