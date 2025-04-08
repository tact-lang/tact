struct ListA {
    a0: Int;
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
}

contract ManyIntFields {
    data: ListA;
    init() {
        self.data = ListA{
            a0: 1, a1: 2, a2: 3, a3: 4,
            a4: 5, a5: 6, a6: 7, a7: 8
        };
    }
}