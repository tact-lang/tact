struct Combo {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
}

contract DiverseFields {
 combo: Combo = Combo{ a:1, b:true, c:"hi", d:null, e:null };
}