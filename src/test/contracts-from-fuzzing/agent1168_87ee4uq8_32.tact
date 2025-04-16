struct Data {
    x: Int;
    y: Bool;
    z: String;
}

contract ManyAssignments {
    val: Data;

    init() {
        self.val = Data{
            x: 5,
            y: false,
            z: "hey"
        };
        self.val = self.val; // test reassignment
    }
}