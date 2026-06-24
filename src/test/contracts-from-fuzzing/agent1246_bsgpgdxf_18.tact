struct ListElement {
    id: Int;
    val: String; 
}

contract BigList {
    e1: ListElement;
    e2: ListElement;
    e3: ListElement;
    e4: ListElement;
    e5: ListElement;
    e6: ListElement;
    e7: ListElement;
    e8: ListElement;

    init() {
        self.e1 = ListElement{ id: 1, val: "a" };
        self.e2 = ListElement{ id: 2, val: "b" };
        self.e3 = ListElement{ id: 3, val: "c" };
        self.e4 = ListElement{ id: 4, val: "d" };
        self.e5 = ListElement{ id: 5, val: "e" };
        self.e6 = ListElement{ id: 6, val: "f" };
        self.e7 = ListElement{ id: 7, val: "g" };
        self.e8 = ListElement{ id: 8, val: "h" };
    }
}