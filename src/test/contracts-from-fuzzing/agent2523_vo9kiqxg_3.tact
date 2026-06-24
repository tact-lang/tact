struct ManyFields {
  a1: Int;
  a2: Int;
  a3: Int;
  a4: Int;
  a5: Int;
  a6: Int;
  a7: Int;
  a8: Int;
  a9: Int;
  a10: Int;
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
  b5: Bool;
  c1: String;
  c2: String;
  c3: String;
  c4: String;
  c5: String;
  d1: Int?;
  d2: Int?;
  d3: Int?;
  d4: Int?;
  d5: Int?;
}

contract BigFieldsTest {
    field: ManyFields;

    init() {
        self.field = ManyFields{
          a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
          b1:true,b2:false,b3:true,b4:false,b5:true,
          c1:"a",c2:"b",c3:"c",c4:"d",c5:"e",
          d1:null,d2:null,d3:null,d4:null,d5:null,
        };
    }
}
