struct Many
{
  a: Int = 1; b: Bool = false; c: String = "hi";
  d: Int?; e: Bool?; f: String?;
}

contract ManyMixed {
  m1: Many = Many{ d:null,e:null,f:null };
  m2: Many = Many{ a:2, b:true, c:"hello",
                    d:null,e:null,f:null };
  init() {}
}