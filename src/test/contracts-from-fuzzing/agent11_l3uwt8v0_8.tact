contract TestStringBuilderConcat {
    receive() {
         let sb: StringBuilder = beginString();
         sb = sb.concat("Hello").concat(", ").concat("Tact!");
         let s: String = sb.toString();
    }
}
