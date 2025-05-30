struct A1 { x: Int; y: Bool; z: Int?; }

contract InlineDefaults {
    a: A1 = A1{x:0,y:false,z:null};
    b: A1 = A1{x:0,y:false,z:null};
    c: A1 = A1{x:0,y:false,z:null};
    
    init() {}
}
