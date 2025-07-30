contract BounceAnalyzer {
    bounced(raw: Slice) {
         // Attempt to read first 8 bits from the raw bounced message slice
         let x: Int = raw.loadUint(8);
         // x is discarded
    }
}
