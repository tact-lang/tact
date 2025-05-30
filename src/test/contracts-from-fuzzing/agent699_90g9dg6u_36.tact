struct ComplexThing { a:Int; b:Bool; c:String; d:Int?; e:Bool?; f:String?; }
contract Defaults {
    v:ComplexThing = ComplexThing{ a:9,b:true,c:"x",d:null,e:null,f:null };
    init() {}
}