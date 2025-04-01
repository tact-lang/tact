import "@stdlib/dns";
import "@stdlib/deploy";

contract DNSTester with Deployable, DNSResolver {
    /// Used for storing temporary values
    tmpC: Cell = cell("te6cckEBAQEAAgAAAEysuc0="); // empty cell

    init() {}

    get fun stringToInternal(src: String): Slice? {
        return dnsStringToInternal(src);
    }

    get fun internalNormalize(src: Slice): Slice {
        return dnsInternalNormalize(src);
    }

    get fun dnsInternalVerify(subdomain: Slice): Bool {
        return dnsInternalVerify(subdomain);
    }

    get fun dnsExtractTopDomainLength(subdomain: Slice): Int {
        return dnsExtractTopDomainLength(subdomain);
    }

    get fun dnsExtractTopDomain(subdomain: Slice): Slice {
        return dnsExtractTopDomain(subdomain);
    }

    override fun doResolveDNS(subdomain: Slice, category: Int): DNSResolveResult {
        return DNSResolveResult{ prefix: subdomain.bits(), record: beginCell().storeSlice(subdomain).endCell() };
    }

    receive("test dnsInternalNormalize throws") {
        let sliceWithRef = beginCell().storeRef(emptyCell()).asSlice();

        // Refs in the passed Slice are prohibited
        self.tmpC = dnsInternalNormalize(sliceWithRef).asCell();
    }
}
