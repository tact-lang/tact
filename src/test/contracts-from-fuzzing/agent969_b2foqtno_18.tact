struct NumList {
    n1: Int;
    n2: Int;
    n3: Int;
    n4: Int;
    n5: Int;
}

contract ListPersist {
    data: NumList;

    init() {
        self.data = NumList{
            n1: 1,
            n2: 2,
            n3: 3,
            n4: 4,
            n5: 5
        };
    }
}
