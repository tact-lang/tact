contract TestTryCatch {
   fun helper() {
       try {
           throw(42);
       } catch (e) {
           dump(e);
       }
   }
   
   receive() {
       self.helper();
   }
}
