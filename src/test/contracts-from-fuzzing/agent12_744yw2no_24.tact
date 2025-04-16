struct MultipleString {
 s1: String;
 s2: String;
 s3: String;
 s4: String;
}

contract TestMultipleString {
 storage: MultipleString;
 init() {
  self.storage = MultipleString{
   s1: "one",
   s2: "two",
   s3: "three",
   s4: "four"
  };
 }
}
