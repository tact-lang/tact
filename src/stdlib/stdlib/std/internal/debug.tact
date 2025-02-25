// these are builtin functions, these get special treatment from FunC
// hence, no asm here

/// Global function.
///
/// Unconditionally throws an exception with an error `code`.
///
/// Execution of the current context stops, statements after `throw` are not executed, and control is passed to the first `try...catch` block on the call stack. If there is no `try` or `try...catch` block among the calling functions, TVM will terminate the transaction.
///
/// Attempts to specify the `code` outside of 0-65535 range cause an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun thisWillTerminateAbruptly() {
///     throw(1042); // throwing with exit code 1042
/// }
///
/// fun butThisWont() {
///     try {
///         throw(1042); // throwing with exit code 1042
///     }
///
///     // ... follow-up logic ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throw
/// * https://docs.tact-lang.org/book/statements/#try-catch
///
@name(throw)
native throw(code: Int);

/// Global function. Available since Tact 1.6.0.
///
/// Similar to `throw()`, but throws an error `code` only if `condition` holds, i.e. `condition` is equal to `true`. Doesn't throw otherwise.
///
/// Attempts to specify the `code` outside of 0-65535 range cause an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// contract Ownership {
///     owner: Address;
///
///     init() {
///         self.owner = myAddress();
///     }
///
///     receive() {
///         // Check the sender is the owner of the contract,
///         // and throw exit code 1024 if it's not
///         throwIf(1024, sender() != self.owner);
///     }
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throwif
/// * https://docs.tact-lang.org/book/statements/#try-catch
///
@name(throw_if)
native throwIf(code: Int, condition: Bool);

/// Global function. Available since Tact 1.6.0.
///
/// Similar to `throw()`, but throws an error `code` only if `condition` does **not** hold, i.e. `condition` is equal to `true{:tact}`. Doesn't throw otherwise.
///
/// This function is also similar to `require()`, but uses the specified `code` directly instead of generating one based on the given error message `String`.
///
/// Attempts to specify the `code` outside of 0-65535 range cause an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// contract Ownership {
///     owner: Address;
///
///     init() {
///         self.owner = myAddress();
///     }
///
///     receive() {
///         // Check the sender is the owner of the contract,
///         // and throw exit code 1024 if it's not
///         throwUnless(1024, sender() == self.owner);
///     }
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throwunless
/// * https://docs.tact-lang.org/ref/core-debug/#require
/// * https://docs.tact-lang.org/book/statements/#try-catch
///
@name(throw_unless)
native throwUnless(code: Int, condition: Bool);

/// Global function. **Deprecated** since Tact 1.6.0.
///
/// Use `throw()` instead.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throw
/// * https://docs.tact-lang.org/ref/core-debug/#nativethrow
///
@name(throw)
native nativeThrow(code: Int);

/// Global function. **Deprecated** since Tact 1.6.0.
///
/// Use `throwIf()` instead.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throwif
/// * https://docs.tact-lang.org/ref/core-debug/#nativethrowif
///
@name(throw_if)
native nativeThrowIf(code: Int, condition: Bool);

/// Global function. **Deprecated** since Tact 1.6.0.
///
/// Use `throwUnless()` instead.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throwunless
/// * https://docs.tact-lang.org/ref/core-debug/#nativethrowunless
///
@name(throw_unless)
native nativeThrowUnless(code: Int, condition: Bool);
