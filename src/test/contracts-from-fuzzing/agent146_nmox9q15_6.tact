struct ManyOptionals {
    a: Int?; b: Bool?; c: Int?; d: Bool?;
    e: Int?; f: Bool?; g: Int?; h: Bool?;
}

contract TestContract {
    many: ManyOptionals = ManyOptionals{
        a:null, b:true, c:5, d:null,
        e:null, f:false, g:null, h:true
    };

    receive(){}
}