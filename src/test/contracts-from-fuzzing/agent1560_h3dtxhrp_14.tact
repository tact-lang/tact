struct Rec1 {
  x: Int;
  y: Bool;
  z: String;
  optInt: Int?;
  optBool: Bool?;
  optString: String?;
}

contract TestContract {
    rec: Rec1 = Rec1{
        x: 10,
        y: false,
        z: "test",
        optInt: null,
        optBool: null,
        optString: null
    };
}