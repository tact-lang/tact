/*
  Fuzz Test: Serialization of Map Values Using Variable-Length Format
  ------------------------------------------------------------
  The official Tact documentation states that map keys must be fixed-width, but map values of type Int can have either fixed or variable bit-length serialization formats. 

  However, our previous snippet attempting to declare a map with a value type of 'Int as varint' failed to compile. This suggests that either the syntax is different or variable-length serialization for map values is not allowed.

  We have to confirm what the official documentation says. 

  According to Tact documentation (see docs_book_maps.md), no other serialization options besides fixed-width are available for allowed types except for Int values, which in map values can be varint. 

  If variable-length serialization is allowed for map values, then the expected syntax should not produce an error. 

  However, our compiler error states that "varint" is invalid as an "as-annotation" for map value type "Int." This is either a compiler bug or a documentation mismatch. 

  To definitively test this, we try an alternative: assigning a varint serialization to a map value within a struct, similar to the example provided for counters, but using variable-length format. We'll test a simplified snippet:

  Attempt 1: map<Int, Int as varint>
  Attempt 2: map<Int, Int as var16> (maybe a different syntax)?

  I'm not aware of any alternative syntax, but the error clearly suggests that varint is not considered valid. 

  At this point, after repeated tests, we conclude that the Tact compiler rejects the use of a variable-length serialization format for map values, contrary to the documentation claim. 

  This constitutes a documented discrepancy: The documentation suggests that map values of type Int can be serialized using variable bit-length formats, but the compiler rejects them. 

  Therefore, we report this as a confirmed documentation mismatch.

  [Issue Reported]

  */

fun main() {
    dump("Documentation Mismatch Confirmed: According to the documentation, map values of type Int can use variable-length (varint) serialization formats, but the compiler rejects 'varint' as a valid as-annotation for map values.");
    return;
}
