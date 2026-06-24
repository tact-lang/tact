struct Sub {
    n: Int;
    flag: Bool;
}

contract StructDefaultInit {
    rec: Sub = Sub{n:42, flag:true};

    init() {
        self.rec = Sub{n: 5, flag:false};
    }
}