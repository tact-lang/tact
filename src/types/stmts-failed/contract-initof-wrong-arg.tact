primitive Int;
primitive Cell;

trait BaseTrait {
    
}

struct StateInit {
    code: Cell;
    data: Cell;
}

contract A {
    owner: Int;
    init(owner: Int) {
        self.owner = owner;
    }
}

contract B {
    init() {

    }

    get fun newInit(): StateInit {
        return initOf A("hello");
    }
}