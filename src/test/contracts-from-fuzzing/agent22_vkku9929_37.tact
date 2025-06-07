contract GarbageUnicode {
  receive("ab\u{110000}") { } 
}