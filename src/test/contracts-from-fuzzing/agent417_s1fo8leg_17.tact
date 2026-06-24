struct MaybeSlices {
    s: Slice?;
    c: Cell?;
}

contract TestContract {
    data: MaybeSlices;
    
    init() {
        self.data = MaybeSlices{
            s: null,
            c: null
        };
    }
}