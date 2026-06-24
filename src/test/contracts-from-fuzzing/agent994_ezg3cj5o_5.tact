struct Optionals {
    i1: Int?;
    i2: Bool?;
    i3: Address?;
    i4: Cell?;
    i5: Slice?;
    s: String?;
}

contract TestContract {
    opt: Optionals;

    init() {
        self.opt = Optionals{
            i1:null, i2:null, i3:null, i4:null, i5:null, s:null
        };
    }
}