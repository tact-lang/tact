// Comprehensive summary of bounce receiver fuzz-testing cycle:

/*
Summary:
---------
Over the course of our fuzz-testing cycle on Tact's bounce receiver functionality, we constructed multiple minimal contracts to assess various aspects:

1. Bounce Receiver Types:
   - We verified that a valid bounced message receiver must either accept a parameter of type bounced<T> (with T sufficiently limited in size to meet the 224-bit payload limit) or a raw Slice. Our contract BounceTestValid successfully accessed a field from a bounced message of type MyMessage after reducing its type size (using uint16) to fit within the allowed limits.
   - In BounceTestRaw, we confirmed that a raw Slice based bounce receiver works as designed.
   - BounceTestDouble shows that when two bounce receivers are provided (one raw and one typed), the compiler accepts both – with the typed version capturing the relevant typed bounce messages when applicable.

2. Type Constraints:
   - As expected, attempts to declare a bounce receiver with an invalid type (e.g. BounceTestInvalid using an Int) result in a compile-time error. This is consistent with the documentation that mandates the parameter to be either bounced<T> (for structured messages) or Slice (for raw messages).
   - Similarly, BounceTestTextInvalid confirms that declaring a bounce receiver for bounced<String> is prohibited (bounced text messages are not supported), aligning perfectly with the published guidance (see docs_book_bounced.md  ).

3. Recursive Bounce Handling:
   - In BounceTestRecursive, instead of attempting to access a non-existent self.address (which is not available), we used a pattern where a bounced message with a non-zero value triggers a self.reply, a standard approach extracted from our documentation in docs_ref_core-base.md   that shows self.reply’s intended usage.

4. Bounce on Failure: 
   - The Sender and Failer contracts simulate a real-world bounce scenario where an outgoing message causes an error (through throw(999)) thereby triggering a bounce. The Sender’s bounce receiver then correctly captures the bounced message, verifying that bounce message processing operates as documented (see docs_book_bounced.md  .

Overall, the Tact compiler consistently enforces the rules detailed in the official documentation regarding bounce receivers. The following points were validated through our fuzz-testing:

   - Bounced messages must respect the 224 usable data bits limit, requiring adjustments to field types when necessary.
   - Only parameters of type bounced<T> (with appropriate T) or raw Slice are allowed in bounce receivers.
   - Bounced text messages are not supported, as demonstrated by compile errors for bounced<String>.
   - Recursive bounce logic should rely on approved communication patterns, such as using self.reply rather than attempting to access self.address directly.
   - Bounce handling in case of failed outbound messages (e.g. through throw) functions correctly.

No discrepancies between the documented behavior and the Tact compiler’s implementation were discovered during our tests. The system faithfully follows the guidelines laid out in the official documentation.

Further exploration can continue along these lines, but current evidence confirms that the bounce receiver functionality is robust and behaves as expected according to our documentation (docs_book_bounced.md, docs_ref_core-base.md, and related entries).
*/

// End of fuzz-testing summary
