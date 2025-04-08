struct InnerStruct {
    inn: Int = 5;
}

contract DefaultsInnerOuter {
    inside: InnerStruct;

    init() {
        self.inside = InnerStruct{};
    }

    receive() {
        let _ = self.inside.inn;
    }
}