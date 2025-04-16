struct OptionalSlices {
   s1: Slice?;
   s2: Slice?;
}

contract MultipleOptSlices {
    val: OptionalSlices;

    init() {
        self.val = OptionalSlices{
            s1: null,
            s2: null,
        };
    }
}