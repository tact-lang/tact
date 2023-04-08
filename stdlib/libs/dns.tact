import "./dns.fc";

struct DNSResolveResult {
    prefix: Int; 
    record: Cell?; 
}

@name(dns_string_to_internal)
native dnsStringToInternal(str: String): Slice?;

@name(dns_internal_normalize)
native dnsInternalNormalize(src: Slice): Slice;

@name(dns_internal_verify)
native dnsInternalVerify(subdomain: Slice): Bool;

fun dnsExtractTopDomainLength(subdomain: Slice): Int {
    let i: Int = 0;
    let needBreak: Bool = false;
    do {
        let char: Int = subdomain.loadUint(8); // we do not check domain.length because it MUST contains \0 character
        needBreak = char == 0;
        if (!needBreak) {
            i = i + 8;
        }
    } until (needBreak);
    require(i != 0, "Invalid DNS name");
    return i;
}

fun dnsExtractTopDomain(subdomain: Slice): Slice {
    let len: Int = dnsExtractTopDomainLength(subdomain);
    return subdomain.loadBits(len);
}

fun dnsResolveNext(address: Address): Cell {
    return beginCell()
        .storeUint(0xba93, 16)
        .storeAddress(address)
        .endCell();
}

fun dnsResolveWallet(address: Address): Cell {
    return beginCell()
        .storeUint(0x9fd3, 16)
        .storeAddress(address)
        .storeUint(0, 8)
        .endCell();
}

trait DNSResolver {

    get fun dnsresolve(subdomain: Slice, category: Int): DNSResolveResult {

        // Normalize
        let delta: Int = 0;
        if (subdomain.preloadUint(8) == 0) {
            subdomain.loadUint(8); // Skip first byte
            delta = delta + 8;
        }

        // Checks correctness
        require(dnsInternalVerify(subdomain), "Invalid DNS name");

        // Resolve
        let res: DNSResolveResult = self.doResolveDNS(subdomain, category);
        return DNSResolveResult{prefix: res.prefix + delta, record: res.record};
    }

    virtual fun doResolveDNS(subdomain: Slice, category: Int): DNSResolveResult {
        return DNSResolveResult{prefix: subdomain.bits(), record: null};
    }
}