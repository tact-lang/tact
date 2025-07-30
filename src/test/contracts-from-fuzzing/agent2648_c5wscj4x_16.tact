struct A { p: Int } 
struct B { p: Int }
struct C { p: Int }
struct D { p: Int }

struct AllStructs {
  a:A; b:B; c:C; d:D;
  optA:A?; optB:B?; optC:C?; optD:D?;
}

contract OptionalEmbed {
  store:AllStructs;

  init(){
    self.store=AllStructs{
      a:A{p:1}, b:B{p:2}, c:C{p:3}, d:D{p:4},
      optA:null, optB:null, optC:null, optD:null
    };
  }
}
