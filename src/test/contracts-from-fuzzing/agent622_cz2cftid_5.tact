struct Medium {
  a: Int = 1;
  b: Bool = true;
  c: String = "hi";
}

contract ArrOfStructs {
  m1: Medium = Medium{a:5,b:false,c:"one"};
  m2: Medium = Medium{a:10,b:true,c:"two"};
  m3: Medium = Medium{a:15,b:false,c:"three"};
  init() {}
}