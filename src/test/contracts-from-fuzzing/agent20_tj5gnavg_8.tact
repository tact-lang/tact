struct Container {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
    f6: Bool?;
}

contract StorageContainer {
    persistentData: Container;

    init() {
        self.persistentData = Container{
            f1: 1,
            f2: true,
            f3: "xyz",
            f4: null,
            f5: null,
            f6: false
        };
    }
}