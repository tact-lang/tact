struct MyComposite {
    num: Int;
    flag: Bool;
}

contract TestComposite {
    state: MyComposite = MyComposite{ num: 100, flag: false };

    // Getter returning a composite type (struct).
    get fun getComposite(): MyComposite {
         return self.state;
    }
    
    receive() {}
}
