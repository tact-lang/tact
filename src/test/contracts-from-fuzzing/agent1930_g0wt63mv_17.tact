struct Mix {
 a: Int;
 b: Bool?;
 c: String;
 d: Address?;
 e: Bool;
}

contract MixFields {
 data: Mix;

 init() {
 self.data = Mix{
 a: 10,
 b: null,
 c: "xyz",
 d: null,
 e: true
 };
 }
}