struct SubStruct {
    x: Int;
    y: String;
}

contract ArrayLikeManyNested {
    f1: SubStruct;
    f2: SubStruct;
    f3: SubStruct;
    f4: SubStruct;
    f5: SubStruct;
    f6: SubStruct;
    f7: SubStruct;

    init() {
        self.f1 = SubStruct{x: 1, y: "a"};
        self.f2 = SubStruct{x: 2, y: "b"};
        self.f3 = SubStruct{x: 3, y: "c"};
        self.f4 = SubStruct{x: 4, y: "d"};
        self.f5 = SubStruct{x: 5, y: "e"};
        self.f6 = SubStruct{x: 6, y: "f"};
        self.f7 = SubStruct{x: 7, y: "g"};
    }
}
