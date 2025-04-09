fun main() {
    let s: Slice = beginCell().storeUint(42, 7).asSlice();
    let validVal: Int = s.loadUint(7);
    // This should trigger a compile/runtime error due to out-of-bound bit length (300 > 256)
    let invalidVal: Int = s.loadUint(300);
}
