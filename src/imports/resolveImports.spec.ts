import { resolveImports } from './resolveImports';
import { createNodeFileSystem } from '../vfs/createNodeFileSystem';
import path from 'path';

describe('resolveImports', () => {
    it('should resolve imports', () => {
        let project = createNodeFileSystem(path.resolve(__dirname, '__testdata', 'project'));
        let stdlib = createNodeFileSystem(path.resolve(__dirname, '__testdata', 'stdlib'));
        let npm = createNodeFileSystem(path.resolve(__dirname, '__testdata', 'node_modules'));
        let resolved = resolveImports({
            project,
            stdlib,
            npm,
            entrypoint: './main.tact'
        });
        expect(resolved).toMatchObject({
            "func": [
                {
                    "code": "",
                    "path": path.resolve(__dirname, '__testdata', 'stdlib', 'stdlib2.fc'),
                },
            ],
            "tact": [
                {
                    "code": "import \"./stdlib2.fc\";",
                    "path": path.resolve(__dirname, '__testdata', 'stdlib', 'stdlib.tact'),
                },
                {
                    "code": "import \"@npm/@dynasty/npm_imported\";",
                    "path": path.resolve(__dirname, '__testdata', 'project', 'imported.tact'),
                },
                {
                    "code": "import \"@npm/hitasp/another_npm_imported\";",
                    "path": path.resolve(__dirname, '__testdata', 'node_modules', '@dynasty', 'npm_imported.tact'),
                },
                {
                    "code": "",
                    "path": path.resolve(__dirname, '__testdata', 'node_modules', 'hitasp', 'another_npm_imported.tact'),
                },
                {
                    "code": "import \"./imported\";",
                    "path": path.resolve(__dirname, '__testdata', 'project', 'main.tact'),
                },
            ],
        });
    });
});