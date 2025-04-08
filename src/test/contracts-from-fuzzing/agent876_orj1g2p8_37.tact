struct Multi {
    a: Int; b: Bool; c: String;
}

contract MultiDefault {
    f1: Multi = Multi{a:1,b:true,c:"x"};
    f2: Multi = Multi{a:2,b:false,c:"y"};
}