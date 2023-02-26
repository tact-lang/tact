import { parseImports } from '../grammar/grammar';
import { VirtualFileSystem } from '../vfs/VirtualFileSystem';
import { resolveLibrary } from './resolveLibrary';

export function resolveImports(args: { entrypoint: string, project: VirtualFileSystem, stdlib: VirtualFileSystem }) {

    //
    // Load stdlib and entrypoint
    //

    // const stdlibFuncPath = args.stdlib.resolve('./stdlib.fc');
    // const stdlibFunc = args.stdlib.readFile(stdlibFuncPath).toString();

    const stdlibTactPath = args.stdlib.resolve('./stdlib.tact');
    const stdlibTact = args.stdlib.readFile(stdlibTactPath).toString();

    const codePath = args.project.resolve(args.entrypoint);
    const code = args.project.readFile(codePath).toString();

    //
    // Resolve all imports
    //

    const importedTact: { code: string, path: string }[] = [];
    const importedFunc: { code: string, path: string }[] = [];
    const processed = new Set<string>();
    const pending: { code: string, path: string }[] = [];
    function processImports(source: string, path: string) {
        const imp = parseImports(source, path);
        for (const i of imp) {

            // Resolve library
            const resolved = resolveLibrary({
                path: path,
                name: i,
                project: args.project,
                stdlib: args.stdlib
            });
            if (!resolved.ok) {
                throw new Error(`Could not resolve import ${i} in ${path}`);
            }

            // Check if already imported
            if (resolved.kind === 'func') {
                if (importedFunc.find((v) => v.path === resolved.path)) {
                    continue;
                }
            } else {
                if (importedTact.find((v) => v.path === resolved.path)) {
                    continue;
                }
            }

            // Load code
            let vfs = resolved.source === 'project' ? args.project : args.stdlib;
            let code: string = vfs.readFile(resolved.path).toString();

            // Add to imports
            if (resolved.kind === 'func') {
                importedFunc.push({ code, path: resolved.path });
            } else {
                if (!processed.has(resolved.path)) {
                    processed.add(resolved.path);
                    pending.push({ path: resolved.path, code });
                }
            }
        }
    }

    // Run resolve
    importedTact.push({ code: stdlibTact, path: stdlibTactPath });
    processImports(stdlibTact, stdlibTactPath);
    processImports(code, codePath);
    while (pending.length > 0) {
        let p = pending.shift()!;
        importedTact.push(p);
        processImports(p.code, p.path);
    }
    importedTact.push({ code: code, path: codePath }); // To keep order same as before refactoring

    // Assemble result
    return {
        tact: [
            ...importedTact,
        ],
        func: [
            // { code: stdlibFunc, path: stdlibFuncPath },
            ...importedFunc
        ]
    };
}