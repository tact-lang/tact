struct DuplicateTypes {
    x: Int;
    y: Int;
    z: Int;
}

contract SameTypeFieldsContract {
    data: DuplicateTypes;

    init() {
        self.data = DuplicateTypes{
            x: 10,
            y: 20,
            z: 30,
        };
    }
}