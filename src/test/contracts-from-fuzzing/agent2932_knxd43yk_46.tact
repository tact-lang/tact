struct LE1 { v: Int; }
struct LE2 { v: LE1; }
struct LE3 { v: LE2; }
struct LE4 { v: LE3; }
contract CHAIN5 {
   data: LE4;
   init() {
       self.data = LE4{ v: LE3{ v: LE2{ v: LE1{ v:234 } } } };
   }
}