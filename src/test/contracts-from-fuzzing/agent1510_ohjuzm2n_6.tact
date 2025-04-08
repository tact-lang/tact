struct Data {
    a: Int;
    b: Bool;
}

struct Container {
    optData: Data?;  
    flag: Bool = true;
}

contract TestContract {
    storage: Container = Container{optData: null, flag: false};

    init() {
        self.storage = Container{optData: null, flag: true};
    }

    receive() {
        let _ = self.storage;
    }
}