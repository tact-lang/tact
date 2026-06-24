struct InnerWithString {
   s: String;
}

struct OuterWithOpt {
   f: InnerWithString?;
}

contract OptStrings {
   data: OuterWithOpt;

   init() {
      self.data = OuterWithOpt { f: null };
   }
}