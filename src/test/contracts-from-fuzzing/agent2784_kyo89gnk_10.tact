struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }
struct S4 { d: Int; }
struct S5 { e: Int; }
struct S6 { f: Int; }
struct S7 { g: Int; }
struct S8 { h: Int; }
struct S9 { i: Int; }
struct S10 { j: Int; }

contract ManyStructs {
    one: S1;
    two: S2;
    three: S3;
    four: S4;
    five: S5;
    six: S6;
    seven: S7;
    eight: S8;
    nine: S9;
    ten: S10;

    init() {
      self.one = S1{a:1};
      self.two = S2{b:2};
      self.three = S3{c:3};
      self.four = S4{d:4};
      self.five = S5{e:5};
      self.six = S6{f:6};
      self.seven = S7{g:7};
      self.eight = S8{h:8};
      self.nine = S9{i:9};
      self.ten = S10{j:10};
    }
}