struct Container {
    f1: Int;
    f2: String?;
    f3: Bool;
    f4: Int?;
    f5: String;
}

contract ContainerTest {
    myfield: Container;

    init() {
        self.myfield = Container{
            f1:1, f2:null, f3:true, f4:null, f5:"done"
        };
    }
}