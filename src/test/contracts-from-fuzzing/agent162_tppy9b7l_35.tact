struct Elem {
   val: Int;
}

struct Holder {
   x: Elem;
   y: Elem;
}

contract MultipleNestedStructs {
   data: Holder;
   init() {
      self.data = Holder{
         x: Elem{ val: 11 },
         y: Elem{ val: 22 },
      };
   }
}