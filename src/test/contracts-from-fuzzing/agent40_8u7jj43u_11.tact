struct OptionalSlices {
    s1: Slice?;
    s2: Slice?;
    s3: Slice?;
}

contract TestOptionalSlices {
    data: OptionalSlices;

    init() {
        self.data = OptionalSlices{
            s1: null,
            s2: null,
            s3: null,
        };
    }

    receive() {
        let tmp = self.data;
    }
}