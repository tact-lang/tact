struct Nested {
  one: Int;
  two: Int;
  three: Int;
  four: Int;
  five: Int;
}

contract ManyNested {
  a:Nested; b:Nested; c:Nested; d:Nested; e:Nested;

  init() {
    self.a=Nested{one:1,two:2,three:3,four:4,five:5};
    self.b=Nested{one:6,two:7,three:8,four:9,five:10};
    self.c=Nested{one:11,two:12,three:13,four:14,five:15};
    self.d=Nested{one:16,two:17,three:18,four:19,five:20};
    self.e=Nested{one:21,two:22,three:23,four:24,five:25};
  }
}
