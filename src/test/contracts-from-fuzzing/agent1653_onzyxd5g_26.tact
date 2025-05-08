struct Mixed {
    a: Int;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    e: Int?;
    f: Bool = false;
    g: Int;
}

contract TestContract {
    field: Mixed = Mixed{a: 5, g: 7, b: null};
    receive() {
        self.field = Mixed{a:1,b:2,c:false,d:true,e:3,f:true,g:4};
    }
}