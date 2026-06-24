struct InnerStruct {
    s: String;
    o: String?;
}

contract TestContract {
    inn: InnerStruct;

    init() {
        self.inn = InnerStruct{ s: "abc", o: null };
    }
}