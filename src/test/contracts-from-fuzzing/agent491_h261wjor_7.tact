struct ContainedOne { a: Int; }
struct ContainedTwo { b: Int; }
struct MainStruct {
    nested1: ContainedOne;
    nested2: ContainedTwo;
    flag: Bool;
    text: String;
    val: Int?;
}

contract Heterogeneous {
   item: MainStruct;
   init() {
       self.item = MainStruct{
           nested1: ContainedOne{ a: 7 },
           nested2: ContainedTwo{ b: 8 },
           flag: false,
           text: "abc",
           val: null,
       };
   }
}