struct Holder {
    n1: Int;
    n2: Int;
    n3: Int;
    n4: Int;
    n5: Int;
}

contract LargeStructField {
    storage: Holder;

    init() {
        self.storage = Holder{
            n1: 1, 
            n2: 2, 
            n3: 3, 
            n4: 4, 
            n5: 5
        };
    }
}