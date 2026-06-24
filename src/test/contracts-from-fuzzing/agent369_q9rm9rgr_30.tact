struct IntsAndOptionals {
    i1: Int;
    i2: Int?;
    i3: Int;
    i4: Int?;
}

contract TestContract {
    data: IntsAndOptionals;

    init() {
        self.data = IntsAndOptionals{
            i1:1,
            i2:null,
            i3:3,
            i4:4
        };
    }
}