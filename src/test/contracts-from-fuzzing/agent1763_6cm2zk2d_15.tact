struct NestedSlices {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
    s4: Slice?;
}

contract TestContract(data: NestedSlices) {
    receive() {
        let _ = self.data;
    }
}