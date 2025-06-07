struct Lower {
    x: Int;
}

struct Upper {
    lower: Lower;
    y: Bool;
}

contract TestContract {
    u: Upper;
    
    init() {
        self.u = Upper{lower: Lower{x:42}, y:true};
    }
    
    receive() {}
}