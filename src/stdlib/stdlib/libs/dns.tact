import "./dns.fc";

/// A struct that contains the result of DNS resolution.
struct DNSResolveResult {
    /// The prefix of the DNS resolution.
    prefix: Int;
    /// The record of the DNS resolution.
    record: Cell?;
}

/// Converts a DNS string to a `Slice` or `null` if conversion is impossible.
@name(dns_string_to_internal)
native dnsStringToInternal(str: String): Slice?;

/// Normalizes the internal DNS representation of the `Slice`.
/// The provided `Slice` must not have any references; otherwise, an exception with
/// [exit code 134] will be thrown: `Invalid argument`.
///
/// [exit code 134]: https://docs.tact-lang.org/book/exit-codes#134
@name(dns_internal_normalize)
native dnsInternalNormalize(src: Slice): Slice;

/// Verifies the internal DNS representation of the subdomain `Slice`.
@name(dns_internal_verify)
native dnsInternalVerify(subdomain: Slice): Bool;

/// Calculates the length of the top domain in the `subdomain` `Slice`.
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

/// Extracts the top domain from a `subdomain` `Slice`.
fun dnsExtractTopDomain(subdomain: Slice): Slice {
    let len: Int = dnsExtractTopDomainLength(subdomain);
    return subdomain.loadBits(len);
}

/// Resolves an `address` `Address` into a `Cell`.
fun dnsResolveNext(address: Address): Cell {
    return beginCell()
        .storeUint(0xba93, 16)
        .storeAddress(address)
        .endCell();
}

/// Resolves a wallet `address` `Address` into a `Cell`.
fun dnsResolveWallet(address: Address): Cell {
    return beginCell()
        .storeUint(0x9fd3, 16)
        .storeAddress(address)
        .storeUint(0, 8)
        .endCell();
}

/// Provides two helper functions for DNS resolution:
///
/// 1. A getter function `dnsresolve()`, which corresponds to its FunC variant.
/// 2. A virtual function `doResolveDNS()`, which creates a struct `DNSResolveResult` from subdomain `Slice` bits.
///
/// ```tact
/// import "@stdlib/dns";
///
/// contract ExampleContract with DNSResolver {
///     // Now, this contract has:
///     // 1. A dnsresolve getter function.
///     // 2. A doResolveDNS virtual function.
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-dns#dnsresolver
///
trait DNSResolver {
    /// Creates a struct `DNSResolveResult` from subdomain `Slice` bits.
    get fun dnsresolve(subdomain: Slice, category: Int): DNSResolveResult {
        // Normalize
        let delta: Int = 0;
        if (subdomain.preloadUint(8) == 0) {
            subdomain.loadUint(8); // Skip first byte
            delta += 8;
        }

        // Checks correctness
        require(dnsInternalVerify(subdomain), "Invalid DNS name");

        // Resolve
        let res: DNSResolveResult = self.doResolveDNS(subdomain, category);
        return DNSResolveResult { prefix: res.prefix + delta, record: res.record };
    }

    /// Creates a struct `DNSResolveResult` from subdomain `Slice` bits.
    virtual fun doResolveDNS(subdomain: Slice, category: Int): DNSResolveResult {
        return DNSResolveResult { prefix: subdomain.bits(), record: null };
    }
}
