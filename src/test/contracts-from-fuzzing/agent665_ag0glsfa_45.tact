struct InnerOptStruct {
    a: Int?;
    b: Bool?;
}

struct Container {
    inner: InnerOptStruct;
    flag: Bool;
}

contract DifferentLayers {
    data: Container = Container{inner:InnerOptStruct{a:null,b:true}, flag:true};

    init() {
        self.data = self.data;
    }

    receive() {
        let _ = self.data;
    }
}