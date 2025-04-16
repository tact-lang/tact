struct OptStruct {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Cell?;
    opt5: Slice?;
}

contract TestContract {
    o: OptStruct;

    init() {
        self.o = OptStruct{
            opt1:null,
            opt2:true,
            opt3:"abc",
            opt4:emptyCell(),
            opt5:emptyCell().asSlice()
        };
    }
}