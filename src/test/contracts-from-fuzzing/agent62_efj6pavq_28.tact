struct Nest1 { a: Int }
struct Nest2 { n1: Nest1 }
struct Nest3 { n2: Nest2 }
struct Nest4 { n3: Nest3 }
struct Nest5 { n4: Nest4 }
struct Nest6 { n5: Nest5 }

contract DeeperContract {
  n6: Nest6;
  init() {
    self.n6 = Nest6{ n5: Nest5{ n4: Nest4{ n3: Nest3{ n2: Nest2{ n1: Nest1{ a:1 }}}}}};
  }
}
