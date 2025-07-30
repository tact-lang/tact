contract OptionalParamTest(
   foo: Int?,
) {
   receive() {
       if (self.foo == null) {
           // foo defaults null implicitly?
       }
   }
}